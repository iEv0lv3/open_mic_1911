require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_user_exists
    sal = User.new('Sal')

    assert_instance_of User, sal
  end

  def test_user_starts_with_name_and_no_jokes
    sal = User.new('Sal')

    assert_equal 'Sal', sal.name
    assert_equal [], sal.jokes
  end

  def test_jokes_can_be_added_to_user
    sal = User.new('Sal')
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal 1, sal.jokes[0].id
    assert_equal 2, sal.jokes[1].id
  end
end
