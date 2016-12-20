module ReisbalansHR
  class Resources
    attr_reader :oauth2_client, :path

    def initialize(oauth2_client, path)
      @oauth2_client = oauth2_client
      @path = path
    end

    def index(filter = '')
      get url_with_filter(filter)
    end

    def find_one!(filter)
      res = index(filter)
      fail "Could not find #{resource_name} with filter [#{filter}]" if res.empty?
      fail "Expected 1 #{resource_name}, but got #{results.size} with filter [#{filter}]" if res.size > 1
      res.first
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

    def url_with_filter(filter)
      url = base_url
      url << "?$filter=#{filter}" unless filter.empty?
      url
    end

    def assert_status_code!(response, code)
      fail "Expected status code #{code}, but got: #{response.inspect}" unless response.status == code
    end

    def resource_name
      self.class.name.demodulize.underscore.humanize.downcase
    end
  end
end
