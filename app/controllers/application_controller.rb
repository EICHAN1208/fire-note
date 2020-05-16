class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_search

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先を変更
  def after_sign_in_path_for(resource)
    articles_path(resource)
  end

  def set_search
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization, :image])
      # アカウント編集の時にname等のストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :organization, :avatar, :avatar_cache, :remove_avatar])
    end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

end
