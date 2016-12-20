module ReisbalansHR
  class Resources
    attr_reader :oauth2_client, :path

    def initialize(oauth2_client, path)
      @oauth2_client = oauth2_client
      @path = path
    end

    def index
      get base_url
    end

    def show(id)
      get [base_url, id].join('/')
    end

    def create(params, &block)
      post base_url, {body: params}, &block
    end

    private

    def access_token
      oauth2_client.client_credentials.get_token('scope' => 'hr')
    end

    def get(url)
      response = access_token.get(url)
      assert_status_code!(response, 200)
      JSON.parse(response.body)
    end

    def post(url, opts, &_block)
      response = access_token.post(url, opts)
      yield response if block_given?
      assert_status_code!(response, 201)
      JSON.parse(response.body)
    end

    def base_url
      "/api/hr#{path}"
    end

    def assert_status_code!(response, code)
      fail "Expected status code #{code}, but got: #{response.inspect}" unless response.status == code
    end

    def resource_name
      self.class.name.demodulize.underscore.humanize.downcase
    end
  end
end
