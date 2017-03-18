module FormHelper
  def setup_summary(summary)
		(User.all - summary.users).each do |user|
			summary.summary_users.build(:user => user, :summary => summary)
		end
		summary
  end
end