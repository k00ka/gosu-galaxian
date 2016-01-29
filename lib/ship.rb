class Ship
  include Sprite
  SPEED = 350 # pixels / second

  def initialize
    self.initialize_sprite
    @x = $game.width / 2
    @y = $game.height - 50
    @image = $game.images[:ship]
    @z = 10
    @radius = 30
  end

  def update
    # move horizontally if <- or -> are pressed
    @x -= SPEED * $game.delta if $game.button_down?(Gosu::KbLeft)
    @x += SPEED * $game.delta if $game.button_down?(Gosu::KbRight)
    # clamp @x so the ship always stays inside the screen
    @x = [[@x, $game.width].min, 0].max
  end
end
