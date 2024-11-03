#!/usr/bin/env ruby
userCheck = User.find_by_username('user')

if User.exists?(:username => "user")
  
else

user = User.new(username: 'user', email: 'test@gmail.com', name: 'user', password: 'r00tr00t', password_confirmation: 'r00tr00t')
user.assign_personal_namespace(Organizations::Organization.default_organization)
user.skip_confirmation!
user.save!

user = User.find_by_username('user')
token = user.personal_access_tokens.create(
            scopes: ['api'],
            name: 'default',
            expires_at: PersonalAccessToken::MAX_PERSONAL_ACCESS_TOKEN_LIFETIME_IN_DAYS.days.from_now
        )
token.save!
puts(token.token)

end
