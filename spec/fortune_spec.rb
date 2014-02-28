require File.dirname(__FILE__) + '/../app/fortune'

describe Fortune do
  before do
    lots = {
      total: {
        "大成功の年になることでしょう。"         => :dai_kichi,
        "結果としては厳しい一年となるでしょう。" => :suesho_kichi
      },
      money: {
        "無駄遣いは控えよ" => :master,
        "貯蓄に回すべし"   => :master
      }
    }
    @fortune = Fortune.new(lots)
    @fortune.weight = :dai_kichi
  end

  describe "filtering lots with weight(:dai_kichi)" do
    it "should have filtered lots" do
      expect(@fortune.send(:lots_filter, :total).size).to eq(1)
    end
  end

  describe "filtering lots with :master" do
    it "should have all lots" do
      expect(@fortune.send(:lots_filter, :money).size).to eq(2)
    end
  end
end
