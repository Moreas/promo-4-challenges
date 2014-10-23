require 'repositories/customers_repository'

class CustomersController
  attr_reader :customers_repository, :view

  def initialize(view)
    @view = view
    @customers_repository = CustomersRepository.new
  end

  def index
    customers = customers_repository.all
    if customers.any?
      customers.each do |customer|
        view.display customer
      end
    else
      view.display "You don't have any customers!"
    end
  end

  def create
    name = view.ask('Name:')
    address = view.ask('Address:')
    phone = view.ask('Phone:')
    customers_repository.create(name: name, address: address, phone: phone)
    view.display 'Adding customer:'
    view.display customers_repository.last
  end
end
