require 'rest-client'
require 'json'
require 'awesome_print'

login = "lucassus%40gmail.com"
password = "demo123"

base_url = "https://#{login}:#{password}@kontomierz.pl"

#response = RestClient.get("#{base_url}/k4/money_transactions.json",
#             params: { user_account_id: 329485, start_on: '01-01-2000' })
#data = JSON.parse(response.body)
#ap data

transaction_data = {
    user_account_id: 329485,
    category_id: 100, # unknown
    currency_amount: 123.99,
    currency_id: nil,
    direction: 'withdrawal',
    #direction: 'deposit',
    name: "Transaction from the client #{Time.now}",
    transaction_on: Time.now,
    client_assigned_id: "payoneer-#{Time.now}"
}
response = RestClient.post("#{base_url}/k4/money_transactions.json",
              money_transaction: transaction_data)
ap response
