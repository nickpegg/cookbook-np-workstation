default[:np_workstation][:keyboard].tap do |k|
  k[:model] = 'pc105'
  k[:layout] = 'us'
  k[:options] = %w(
    ctrl:nocaps
    terminate:ctrl_alt_bksp
  )
end
