User.create(
  email: 'b.ourognao@gmail.com',
  uid: 'b.ourognao@gmail.com',
  password: 'omoroi2018',
  name: 'Bago',
  kind: :engineer,
  status: :active,
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)
