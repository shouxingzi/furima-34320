FactoryBot.define do
  factory :purchase_history_destination do
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    postcode{'386-1436'}
    prefecture_id { 46 }
    city{'佐世保市'}
    address{'345-1'}
    building_name{'青木葉ハイツ２０３'}
    phone_number{'09023459878'}    
  end
end
