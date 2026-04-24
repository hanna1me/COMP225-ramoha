module ApplicationHelper
  def nav_link(link_path)
    # reduces amount of time i have to reuse css
    base_classes = "group flex flex-row items-center gap-5 rounded-lg px-3 py-2 transition-all text-sm"

    # if we are on current page, make visible through orange bg and white text
    if current_page?(link_path)
      "#{base_classes} bg-[var(--highlighter-yellow)] text-[var(--typography-black)]"
    # otherwise just highlight on hover
    else
      "#{base_classes} text-[var(--typography-black)] hover:bg-black/5 dark:text-neutral-300 dark:hover:bg-neutral-800"
    end
  end
end
