Pod::Spec.new do |s|
  s.name         = 'SwissEphemeris'
  s.version      = '1.0.0'
  s.summary      = 'Swiss Ephemeris Swift wrapper'
  s.homepage     = 'https://github.com/vsmithers1087/SwissEphemeris'
  s.license      = { :type => 'MIT' }
  s.author       = { 'vsmithers1087' => '' }

  s.platform     = :ios, '13.0'
  s.swift_version = '5.5'

  s.source = {
    :git => 'https://github.com/你的账号/SwissEphemeris.git',
    :tag => s.version.to_s
  }

  # =====================
  # C MODULE
  # =====================
  s.subspec 'CSwissEphemeris' do |cs|
    cs.source_files = 'Sources/CSwissEphemeris/**/*.c'
    cs.public_header_files = 'Sources/CSwissEphemeris/include/**/*.h'
    cs.header_mappings_dir = 'Sources/CSwissEphemeris/include'

    # 🔴 关键三行
    cs.module_name = 'CSwissEphemeris'
    cs.module_map  = 'Sources/CSwissEphemeris/include/module.modulemap'
    cs.requires_arc = false

    cs.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ENABLE_MODULES' => 'YES'
    }
  end

  # =====================
  # SWIFT MODULE
  # =====================
  s.subspec 'Swift' do |ss|
    ss.source_files = 'Sources/SwissEphemeris/**/*.swift'
    ss.dependency 'SwissEphemeris/CSwissEphemeris'
  end

  s.default_subspec = 'Swift'
end
