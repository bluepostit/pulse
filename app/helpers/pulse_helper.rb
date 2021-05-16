module PulseHelper
  def checkin_bs_context_name(checkin)
    contexts = {
      'safe' => 'success',
      'in danger' => 'warning',
      'injured' => 'danger',
      'need help' => 'danger'
    }
    contexts[checkin.pulse_status.name] || 'info'
  end
end
