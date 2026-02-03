Pod::Spec.new do |s|
  s.name         = 'SwissEphemeris'
  s.version      = '1.0.0'
  s.summary      = 'Swiss Ephemeris Swift wrapper'
  s.description  = 'Swift wrapper for Swiss Ephemeris astronomical calculations.'
  s.homepage     = 'https://github.com/vsmithers1087/SwissEphemeris'
  s.license      = { :type => 'MIT' }
  s.author       = { 'vsmithers1087' => '' }

  s.platform     = :ios, '13.0'
  s.swift_version = '5.5'

  s.source       = {
    :git => 'https://github.com/mark-born/SwissEphemeris.git',
    :tag => s.version.to_s
  }

  s.source_files = 'Sources/SwissEphemeris/**/*.{swift}'
end
