Pod::Spec.new do |s|
  s.name         = "AMColorButton"
  s.version      = “0.1.2”
  s.summary      = "User can set title and background colour for NSButton"

  s.description  = <<-DESC
                   You can create custom NSButton with title, background colours. Also you can select colours with IB.
                   DESC

  s.homepage     = "https://github.com/olyaluts/AMColorButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Dasha Kovalenko" => "dk@anahoret.com",
		     "Olya Lutsyk" => "ol@anahoret.com"}
  s.platform     = :osx, '10.10'
  s.source       = { :git => "https://github.com/olyaluts/AMColorButton.git" }
  s.source_files  = 'AMColorButton/AMColorButton/*.{h,m}'
  s.requires_arc = true
end
