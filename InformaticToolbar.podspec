Pod::Spec.new do |s|

  s.name         = "InformaticToolbar"
  s.version      = "0.2"
  s.summary      = "The information can be shown on a toolbar is more than you can imagine."

  s.description  = <<-DESC
                    InformaticToolbar is mainly an UIViewController Category which allows you to add several ___UIBarButtonItem___s set to your toolbar.

                    The sets are defined as subclasses of ___ITBarItemSet___. All ___ITBarItemSet___ can have a ___dismiss button___ if the target and action has been defined. If more than one set has been added, a ___switch button___ (an arrow) will be displayed on the left for user to switch between sets.

                    For now, there are three pre-defined set:

                    - ___ITLabelBarItemSet___: a textLabel and a detailTextLabel
                    - ___ITProgressBarItemSet___: a textLabel and a progressBar
                    - ___ITConfirmationBarItemSet___: two label and a check-mark button

                    You can easily create new sets by extending ___ITBarItemSet___ yourself.
                   DESC

  s.homepage     = "https://github.com/gregwym/InformaticToolbar"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Greg Wang" => "gregwym@gmail.com" }

  s.platform     = :ios
  s.source       = { :git => "https://github.com/gregwym/InformaticToolbar.git", :tag => "v0.2" }
  s.source_files  = 'InformaticToolbar/InformaticToolbar/**/*.{h,m}'

end
