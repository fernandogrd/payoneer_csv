require 'rest-client'
require 'json'
require 'awesome_print'

login = "lucassus%40gmail.com"
password = "demo123"

base_url = "https://#{login}:#{password}@kontomierz.pl"
#RestClient.get("#{base_url}/k4/categories.json", params: { direction: false, in_wallet: true })

response = RestClient.get("#{base_url}/k4/money_transactions.json",
                          params: { user_account_id: 329485, start_on: '01-01-2000' })
data = JSON.parse(response.body)
ap data
