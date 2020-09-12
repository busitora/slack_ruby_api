class Lgtm
  def image
    url = 'https://www.lgtm.app/api/images/random'
    res = Faraday.get(url)
    res_body = JSON.parse(res.body)
    res_body['imageURL']
    # lgtmと同じだし共通化したいね
  end
end
