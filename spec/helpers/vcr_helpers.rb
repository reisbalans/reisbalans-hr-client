module VcrHelpers
  def remove_basic_auth!(request)
    request.headers.delete('Authorization')
    request.uri.gsub!(%r(^(https?:\/\/)(.*:.*@)(.*)$), '\1\3')
  end

  def match_uri_without_basic_auth
    ->(expected, actual) do
      remove_basic_auth!(expected)
      expected.uri == actual.uri
    end
  end
end
