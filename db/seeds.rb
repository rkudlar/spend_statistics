User.create([{ email: 'rkudla.dev@gmail.com', password: 'password' }]) if Rails.env.development?
Category.create([{ name: 'Їжа' }])
Category.create([{ name: 'Одяг' }])
Category.create([{ name: 'Подорожі' }])
Category.create([{ name: 'Освіта' }])
Category.create([{ name: 'Відпочинок' }])
Category.create([{ name: 'Інше' }])
