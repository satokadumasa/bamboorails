class FollowController < ApplicationController
  def add
  	logger.debug("FollowController.add params:" << params.inspect)

  end

  def remove
  	logger.debug("FollowController.remove params:" << params.inspect)
  end

  def block
  	logger.debug("FollowController.block params:" << params.inspect)
  end
end
