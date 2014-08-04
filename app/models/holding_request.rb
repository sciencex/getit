class HoldingRequest
  attr_reader :holding, :user
  def initialize(holding, user)
    unless(holding.is_a?(GetIt::Holding::NyuAleph))
      raise ArgumentError.new("Expecting #{holding} to be a GetIt::Holding::NyuAleph")
    end
    unless(user.is_a?(User))
      raise ArgumentError.new("Expecting #{user} to be a User")
    end
    @holding = holding
    @user = user
  end

  # Makes a call to the Aleph API to determine if the
  # GetIt::AlephPatron has access to place a request
  # on the item, therefore, this call is a great candidate
  # for caching
  def circulation_policy
    @circulation_policy ||= begin
      Rails.cache.fetch("#{cache_id}.circulation_policy", expire_in: 1.hour) do
        item.circulation_policy
      end
    end
  end

  def create_hold(parameters)
    item.create_hold(parameters)
  end

  def hash
    [holding, user].hash
  end

  private
  def cache_id
    "#{self.class.name}-#{hash}"
  end

  def item
    @item ||= record.item(item_id)
  end

  def record
    @record ||= aleph_patron.record(record_id)
  end

  def record_id
    @record_id ||= holding.record_id
  end

  def item_id
    @item_id ||= holding.item_id
  end

  def aleph_patron
    @aleph_patron ||= GetIt::AlephPatron.new(user)
  end
end
