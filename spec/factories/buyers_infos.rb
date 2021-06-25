FactoryBot.define do
  factory :buyers_info do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {'123-1234'}
    prefecture_id {1}
    city {'大阪市北区'}
    address {'長柄西1-1-1'}
    building_name {'タワーマンションぽぽっこ'}
    tel_number {'09012345678'}
  end
end
