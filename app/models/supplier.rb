class Supplier < Client
  #delegate :find, :first, :first!, :last, :last!, :all, :exists?, :any?, :many?, :to => :scoped

  def self.all
    self.where("cate = 1")
  end

  before_save :set_cate

  def set_cate
    self.cate = 1
  end

end
