module InterestedeventsHelper
  def events_tab(active_tab, target_tab)
    # css used for both states
    base_classes = "px-6 py-3 font-medium transition-all border-b-2"

    if active_tab == target_tab
      # css specific for active tab
      "#{base_classes} border-[var(--brand-blue)] text-[var(--brand-blue)]"
    else
      # css for inactive tab
      "#{base_classes} border-transparent text-neutral-500 hover:text-neutral-700"
    end
  end
end
