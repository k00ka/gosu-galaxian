class Bullet
  include Sprite
  SPEED = 400 # pixels / second

  def initialize(x, y)
    self.initialize_sprite
    @x = x
    @y = y
    @image = $game.images[:bullet]
    @z = 1
    @radius = 10
  end

  def update
    # move upwards
    @y -= SPEED * $game.delta

    # collisions against aliens
    $game.aliens.each do |alien|
      if self.colliding?(alien)
        # destroy both alien and bullet
        alien.kill!
        self.kill!
        $game.score += 10 # increase score
        $game.audio[:kill].play # play explosion sfx
      end
    end

    # bonus points for killing the entire squad
    $game.squads.each do |squad|
      if squad.killed?
        $game.score += 1000
      end
    end

    # destroy the laser when out of the screen
    self.kill! if @y < -15
  end
end
