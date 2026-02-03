Pod::Spec.new do |s|
  s.name         = 'SwissEphemeris'
  s.version      = '1.0.0'
  s.summary      = 'Swiss Ephemeris Swift wrapper'
  s.description  = 'Swift wrapper around the Swiss Ephemeris C library.'
  s.homepage     = 'https://github.com/vsmithers1087/SwissEphemeris'
  s.license      = { :type => 'MIT' }
  s.author       = { 'vsmithers1087' => '' }

  s.platform     = :ios, '13.0'
  s.swift_version = '5.5'
  s.requires_arc = true

  s.source = {
    :git => 'https://github.com/mark-born/SwissEphemeris.git',
    :tag => s.version.to_s
  }

  # =========================
  # C Swiss Ephemeris
  # =========================
  s.subspec 'CSwissEphemeris' do |cs|
    cs.source_files = 'Sources/CSwissEphemeris/**/*.{c}'
    cs.public_header_files = 'Sources/CSwissEphemeris/include/**/*.h'
    cs.header_mappings_dir = 'Sources/CSwissEphemeris/include'

    cs.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ENABLE_MODULES' => 'YES'
    }
  end

  # =========================
  # Swift Wrapper
  # =========================
  s.subspec 'Swift' do |ss|
    ss.source_files = 'Sources/SwissEphemeris/**/*.swift'
    ss.dependency 'SwissEphemeris/CSwissEphemeris'
  end

  # 默认 subspec
  s.default_subspec = 'Swift'
end
