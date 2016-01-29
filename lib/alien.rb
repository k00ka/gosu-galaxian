class Alien
  include Sprite

  attr_accessor :released

  def initialize(x_pos)
    self.initialize_sprite
    @x = x_pos || rand($game.width)
    @y = -80
    @z = 1
    @image = $game.images[:alien]
    @radius = 20
    @released = false

    # Change from random horizontal and vertical speed
    @speed_x = [-1, 1].sample * rand(50 * speed_up_factor)
    @speed_y = 100 * speed_up_factor
  end

  def update
    if @released
      @x += @speed_x * $game.delta
      @y += @speed_y * 2 * $game.delta
    else
      @y += @speed_y * $game.delta
    end

    # collisions against the ship
    $game.ship.kill! if self.colliding?($game.ship)

    # destroy alien when out of the screen
    self.kill! if @y > $game.height + 25
  end

  def speed_up_factor
    2 - 1 / ($game.score / 40 + 1)
  end
end
