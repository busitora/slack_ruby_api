class Cat
  def image
    url = 'https://api.thecatapi.com/v1/images/search'
    res = Faraday.get(url)
    res_body = JSON.parse(res.body)
    res_body[0]['url']
  end
end
