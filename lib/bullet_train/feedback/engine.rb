module BulletTrain
  module Feedback
    class Engine < ::Rails::Engine
      initializer "bullet_train.feedback" do |app|
        BulletTrain.linked_gems << "bullet_train-feedback"
      end
    end
  end
end
