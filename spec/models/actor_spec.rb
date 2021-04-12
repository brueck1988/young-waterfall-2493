require "rails_helper"

describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors) }
  end

  before(:each) do
    @studio_1 = Studio.create!(name: "MGM", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Warner Brothers", location: "Hollywood")

    @movie_1 = @studio_1.movies.create!(title: "The Sandlot", creation_year: 1990, genre: "Kids")
    @movie_2 = @studio_1.movies.create!(title: "Fear and Loathing in Las Vegas", creation_year: 1995, genre: "Gonzo")
    @movie_3 = @studio_1.movies.create!(title: "Snatch", creation_year: 1997, genre: "Crime")
    @movie_4 = @studio_2.movies.create!(title: "A Space Odyssey: 2001", creation_year: 1969, genre: "Sci-Fi")



    @actor_1 = Actor.create!(name: 'Harrison Ford',
                            age: 70,
                            currently_working: true)

    @actor_2 = Actor.create!(name: 'Owen Wilson',
                            age: 49,
                            currently_working: true)

    @actor_3 = Actor.create!(name: 'Ben Stiller',
                            age: 54,
                            currently_working: true)

    @actor_4 = Actor.create!(name: 'Sean Connery',
                            age: 85,
                            currently_working: false)

    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_1)
    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_2)
    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_3)
    @movie_actor_1 = MovieActor.create!(movie: @movie_1, actor: @actor_4)
    @movie_actor_1 = MovieActor.create!(movie: @movie_2, actor: @actor_1)
    @movie_actor_1 = MovieActor.create!(movie: @movie_3, actor: @actor_1)
    @movie_actor_1 = MovieActor.create!(movie: @movie_4, actor: @actor_2)
    @movie_actor_1 = MovieActor.create!(movie: @movie_4, actor: @actor_3)
  end

  describe "class methods" do
    describe "::order_by_age" do
      it 'orders actors correctly by age' do
        expect(Actor.order_by_age.to_a).to eq([@actor_4, @actor_1, @actor_3, @actor_2])
      end
    end

    describe "::currently_working" do
      it 'shows only actors that are currently working' do
        expect(Actor.currently_working.to_a).to eq([@actor_1, @actor_2, @actor_3])
      end
    end
  end
end
