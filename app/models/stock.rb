class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    headers = {"Content-Type" => "application/json", "Authorization" => "Token #{Rails.application.credentials.tiingo[:api_token]}" }

    uri = URI("https://api.tiingo.com/iex/?tickers=" + ticker_symbol.downcase)
    req = Net::HTTP::Get.new(uri)

    headers.each { |key, value| req[key.to_s] = value}

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    res = http.request(req)
    response = JSON.parse(res.body)
    
    begin
      new(ticker: response.first["ticker"], last_price: response.first["last"])
    rescue
      return nil
    end
  end

end
