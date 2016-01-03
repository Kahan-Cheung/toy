module SessionsHelper
    
    # 登入指定的用户
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # 在持久会话中记住用户
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    # 如果指定用户是当前用户，返回 true
    def current_user?(user)
        user == current_user
    end
    
    # 返回当前登录的用户（如果有的话）
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    
    # 如果用户已登录，返回 true，否则返回 false
    def logged_in?
        !current_user.nil?
    end
    
    #是否是管理员
    def  admin_in?
       logged_in?&&current_user.admin?
       # !!(logged_in?&&current_user.email=='craigzkh@163.com')
    end
    
    #忘记持久会话
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # 退出当前用户
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    #统计当前正式成员的数量
    def count_menber(menbers)
        count = 0;
        menbers.each do |m|
          if m.status ==1
              count=count+1
          end
        end
        return count
    end

    #当前用户是不是队长
    def leader?(group)
         @temp_menber = Menber.where('user_id = ? and group_id = ?', 
                       current_user.id, group.id)

         if @temp_menber[0] 
             if @temp_menber[0].authority == 1
                return true
             else
                return false
             end
         else
            return false
         end
    end
end
