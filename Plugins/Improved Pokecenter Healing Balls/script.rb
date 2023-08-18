class MakeHealingBallGraphics

  def initialize
    balls=[]
    for poke in $player.party
      balls.push(poke.poke_ball) if !poke.egg? #balls.push(poke.ballused) if !poke.isEgg?
    end
    return false if balls.length==0
    @sprites={}
    @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z=999999
    for i in 0...balls.length
      @sprites["ball#{i}"]=Sprite.new(@viewport)
      if pbResolveBitmap("Graphics/Pictures/Balls/ball_#{balls[i]}.png")
        @sprites["ball#{i}"].bitmap=Bitmap.new("Graphics/Pictures/Balls/ball_#{balls[i]}.png")
      else
        @sprites["ball#{i}"].bitmap=Bitmap.new("Graphics/Pictures/Balls/ball_0.png")
      end
      @sprites["ball#{i}"].visible=false
    end
    bitmap1=Bitmap.new(256,192)
    bitmap2=Bitmap.new(256,192)
    rect1=Rect.new(0,0,256,192/4)
    for i in 0...balls.length
      case i
      when 0
        bitmap1.blt(36,50,@sprites["ball#{0}"].bitmap,rect1)
      when 1
        bitmap2.blt(36,50,@sprites["ball#{0}"].bitmap,rect1)
        bitmap2.blt(48,50,@sprites["ball#{1}"].bitmap,rect1)
      when 2
        bitmap1.blt(36,98,@sprites["ball#{0}"].bitmap,rect1)
        bitmap1.blt(48,98,@sprites["ball#{1}"].bitmap,rect1)
        bitmap1.blt(36,106,@sprites["ball#{2}"].bitmap,rect1)
      when 3
		bitmap2.blt(36,98,@sprites["ball#{0}"].bitmap,rect1)
        bitmap2.blt(48,98,@sprites["ball#{1}"].bitmap,rect1)
        bitmap2.blt(36,106,@sprites["ball#{2}"].bitmap,rect1)
        bitmap2.blt(48,106,@sprites["ball#{3}"].bitmap,rect1)
      when 4
		bitmap1.blt(36,146,@sprites["ball#{0}"].bitmap,rect1)
		bitmap1.blt(48,146,@sprites["ball#{1}"].bitmap,rect1)
		bitmap1.blt(36,154,@sprites["ball#{2}"].bitmap,rect1)
		bitmap1.blt(48,154,@sprites["ball#{3}"].bitmap,rect1)
		bitmap1.blt(36,162,@sprites["ball#{4}"].bitmap,rect1)
      when 5
		bitmap2.blt(36,146,@sprites["ball#{0}"].bitmap,rect1)
		bitmap2.blt(48,146,@sprites["ball#{1}"].bitmap,rect1)
		bitmap2.blt(36,154,@sprites["ball#{2}"].bitmap,rect1)
		bitmap2.blt(48,154,@sprites["ball#{3}"].bitmap,rect1)
        bitmap2.blt(36,162,@sprites["ball#{4}"].bitmap,rect1)
        bitmap2.blt(48,162,@sprites["ball#{5}"].bitmap,rect1)
      end
      Graphics.update
    end
    if RTP.exists?("Graphics/Characters/Healing balls 1.png")
      File.delete("Graphics/Characters/Healing balls 1.png")
    end
    if RTP.exists?("Graphics/Characters/Healing balls 2")
      File.delete("Graphics/Characters/Healing balls 2")
    end
    bitmap1.to_file("Graphics/Characters/Healing balls 1.png")
    bitmap2.to_file("Graphics/Characters/Healing balls 2.png")
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
    bitmap1.dispose
    bitmap2.dispose
  end
end