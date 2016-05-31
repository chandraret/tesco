
class TescoBasePage
  include PageObject
  include PageObject::PageFactory
  include DataMagic


  attr_accessor :browser

  def initialize(browser, visit = false)
    super(browser, visit)
    wait_until(30, "correct page not loaded") { page_load_element.exists? }
  end

  def current_page?
    page_load_element.exists?
  end

  def url_contains?(partial_url)
    @browser.url.include? partial_url
  end

  def click_on_link(text)
    @browser.link(:text => text).when_present.click
  end

  def has_text(text)
    browser.text.include? text
  end

  def randomx(arr)
    n = arr.length.to_i - 1
    rand(0..n)
  end

  def is_element_displayed(object)
    begin
      is_it_displayed = object_element.exists?
    rescue
      is_it_displayed = false
    end
  end

  def self.dest_url
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "#{EnvConfig["base_url"]}#{EnvConfig["destination_browse_sit"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "#{EnvConfig["base_url"]}#{EnvConfig["destination_browse_uat"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["destination_browse_test"]}"
    end
  end

  def self.things_to_see_url
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["things_to_see_sit"]}"
      # "#{EnvConfig["base_url"]}#{EnvConfig["things_to_see_sit"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "#{EnvConfig["base_url"]}#{EnvConfig["things_to_see_sit"]}"
    elsif EnvConfig["base_url"] == "http://mgnlauth-vhols-test3.webdev.vholsinternal.co.uk"
      return "#{EnvConfig["base_url"]}#{EnvConfig["things_to_see_test"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["things_to_see_test"]}"
    end
  end

  def self.destinations_in_url
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["destinations_in_sit"]}"
      # "#{EnvConfig["base_url"]}#{EnvConfig["things_to_see_sit"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk#{EnvConfig["destinations_in_sit"]}"
    elsif EnvConfig["base_url"] == "http://mgnlauth-vhols-test3.webdev.vholsinternal.co.uk"
      return "#{EnvConfig["base_url"]}#{EnvConfig["destinations_in_test"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["destinations_in_test"]}"
    end
  end

  def self.dest_url_home_page
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "http://vhols-sit.webdev.vholsinternal.co.uk"
      # "#{EnvConfig["base_url"]}#{EnvConfig["destination_browse_sit"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk"
    else
      return "#{EnvConfig["base_url"]}"
    end
  end

  def self.home_page
    return "#{EnvConfig["base_url"]}#{EnvConfig["home_page"]}"
  end

  def self.wonderlist_get_in_touch_page
    "#{EnvConfig["base_url"]}#{EnvConfig["wonderlist_get_in_touch_page"]}"
  end

  def is_text_displayed?(text)
    @browser.text.include? text
  end

  def ascending? arr
    arr == arr.sort
  end

  def descending? arr
    arr == arr.sort.reverse
  end

  def self.sign_up_url
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk/"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["sign_up_page"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk#{EnvConfig["sign_up_page"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["sign_up_page"]}"
    end
  end

  def self.sign_up_confirmation_url
    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk/"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["sign_up_confirmation_page"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk#{EnvConfig["sign_up_confirmation_page"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["sign_up_confirmation_page"]}"
    end
  end

  def self.dest_url_500
    return "#{EnvConfig["base_url"]}#{EnvConfig["500_error_page"]}"
  end

  def self.dest_url_no_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["destination_no_results"]}"
  end

  def self.dest_url_hotel_specific_search
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_specific_search"]}"
  end

  def self.dest_url_hotel_only_search_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_only_search_results"]}"
  end

  def self.dest_url_hotel_only_search_results_with_five_passengers_two_rooms
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_only_search_results_with_five_passengers_two_rooms"]}"
  end

  def self.dest_url_faq_page

    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["faq_homepage"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk#{EnvConfig["faq_homepage"]}"
    elsif EnvConfig["base_url"] == "http://vhols-test2.webdev.vholsinternal.co.uk"
      return "http://vhols-test2.webdev.vholsinternal.co.uk#{EnvConfig["faq_homepage"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["faq_homepage"]}"
    end
  end


  def self.dest_url_contact_us_page

    if EnvConfig["base_url"] == "http://vhols-sit.webdev.vholsinternal.co.uk"
      return "http://vhols-sit.webdev.vholsinternal.co.uk#{EnvConfig["contact_us_faq_page"]}"
    elsif EnvConfig["base_url"] == "http://vhols-uat.webdev.vholsinternal.co.uk"
      return "http://vhols-uat.webdev.vholsinternal.co.uk#{EnvConfig["contact_us_faq_page"]}"
    elsif EnvConfig["base_url"] == "http://vhols-test2.webdev.vholsinternal.co.uk"
      return "http://vhols-test2.webdev.vholsinternal.co.uk#{EnvConfig["contact_us_faq_page"]}"
    else
      return "#{EnvConfig["base_url"]}#{EnvConfig["contact_us_faq_page"]}"
    end
  end

  def self.dest_url_concierge_page
    return "#{EnvConfig["base_url"]}#{EnvConfig["concierge_page"]}"
  end

  def self.dest_url_complete_holiday_options
    return "#{EnvConfig["base_url"]}#{EnvConfig["complete_holiday_options"]}"
  end

  def self.dest_url_complete_holiday_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["complete_holiday_results"]}"
  end

  def self.dest_url_complete_holiday_car_options
    return "#{EnvConfig["base_url"]}#{EnvConfig["complete_holiday_car_options"]}"
  end

  def self.dest_url_hotel_only_options_browse
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_only_options_browse"]}"
  end

  def self.dest_url_hotel_only_list_browse
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_only_results_browse"]}"
  end

  def self.hotel_specific_no_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_search_no_results"]}"
  end

  def self.dest_url_flydrive
    return "#{EnvConfig["base_url"]}#{EnvConfig["flydrive_options"]}"
  end

  def self.dest_url_car_only_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["car_only_results"]}"
  end

  def self.hotel_results_page
    return "#{EnvConfig["base_url"]}#{EnvConfig["hotel_results_page"]}"
  end


  def self.dest_url_complete_holiday_checkout_results
    return "#{EnvConfig["base_url"]}#{EnvConfig["complete_holiday_checkout_results"]}"
  end

end