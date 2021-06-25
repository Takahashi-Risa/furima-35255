FactoryBot.define do
  factory :buy_item do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-1234'}
    prefecture_id { 2 }
    city {'大阪市北区'}
    address {'長柄西1-1-1'}
    building {'タワーマンションぽぽっこ'}
    phone_number {'09012345678'}
    
  end
end