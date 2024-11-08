#!/usr/bin/env ruby
user = User.new(username: 'user', email: 'test@gmail.com', name: 'user', password: 'us3rus3r', password_confirmation: 'us3rus3r')
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
