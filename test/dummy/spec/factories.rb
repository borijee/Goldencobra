require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :article, :class => Goldencobra::Article do
    title "Article Title"
    url_name "short-title"
    startpage false
    active true
  end


  factory :menue, :class => Goldencobra::Menue do
    title 'Nachrichten'
    target 'www.ikusei.de'
    active true
    css_class 'news'
  end

  factory :setting, :class => Goldencobra::Setting do
    title 'Einstellung1'
    value "Wert1"
  end

  factory :admin_user, :class => User do
    email 'admin@test.de'
    firstname "Tim"
    lastname "Test"
    password 'secure12'
    password_confirmation 'secure12'
    confirmed_at "2012-01-09 14:28:58"
  end

  factory :admin_permission, :class => Goldencobra::Permission do
    action "manage"
    subject_class ":all"
    subject_id ""
  end

  factory :guest_user, :class => User do
    email 'guest@test.de'
    password 'secure12'
    password_confirmation 'secure12'
  end

  factory :user, class: User do |u|
    u.email Faker::Internet.email
    u.firstname Faker::Name.first_name
    u.lastname Faker::Name.last_name
    u.password 'bitte_aendern'
    u.password_confirmation 'bitte_aendern'
  end

  factory :widget, class: Goldencobra::Widget do |w|
    w.title "Mein Widget"
    w.content "<ul><li><p>Mein Widget</p></li></p>"
    w.css_name "meine-liste"
    w.active true
  end

  factory :startpage, :class => Goldencobra::Article do |u|
    u.title "Startseite"
    u.url_name "root"
    u.active true
  end

  factory :role, :class => Goldencobra::Role do |r|
    r.name "admin"
  end


  factory :admin_role, :class => Goldencobra::Role do |r|
    r.name "admin"
  end

  factory :guest_role, :class => Goldencobra::Role do |r|
    r.name "guest"
  end
end
