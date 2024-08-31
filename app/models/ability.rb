class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # если пользователь не авторизован
  
      if user.admin?
        can :manage, :all # администратор может управлять всем
      else
        can :read, Product # обычный пользователь может только просматривать товары
      end
    end
  end
  