class Fortune

  LUCKY = {
    dai_kichi:    "大吉",
    chu_kichi:    "中吉",
    sho_kichi:    "小吉",
    kichi:        "吉",
    han_kichi:    "半吉",
    sue_kichi:    "末吉",
    suesho_kichi: "末小吉"
  }

  attr_writer :weight

  def initialize(lots = nil)
    raise ArgumentError.new("Expected a argument of lots") if lots.nil?
    @lots = lots
    @weight = LUCKY.to_a.sample.first
  end

  def draw(lot_type = nil)
    if lot_type
      _draw lot_type
    else
      LUCKY[@weight]
    end
  end

  private

    def _draw(lot_type)
      lots_filter(lot_type).to_a.sample.first
    end

    def lots_filter(lot_type)
      @lots[lot_type].select { |k,v|
        v == @weight || v == :master
      }
    end
end
