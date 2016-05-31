
 class TescoGroceriesSearchPage < TescoBasePage

    page_url "#{EnvConfig["base_url"]}#{EnvConfig["search"]}"

    # Method identifiers
    text_field :search_box, id: 'searchBox-1'
    #text_field :product_wish_to_buy, xpath: "//*[@id='searchBox-1']/input"
    button :search, id: 'searchBtn'
    text_field :free_text_in_search_field, id: 'searchBox-1'
    div :warning_message_panel, class: 'infoContainer alertDialog'
    div :pod, class: 'desc'
    h1 :result_count, text: /results for/
    list_items :products, xpath: "//div[@class='allProducts']//li"
    h1 :no_results_message, text: "No results for 'somexyz'"
    link :back_to_previous_page, text: 'Back to previous page'
    list_items :specific_filter, xpath: "//div[@class='filterGroup area_filters']//li"
    #unordered_list :specific_filter_labels, class: 'tertNav'
    div :pod, class: 'desc'
    select_list :choose_category, id: 'sortProductListItems-3'
    button :submit_go, id: 'sortProductList-3'
    span :product_titles, xpath: "//div[@class='allProducts']//h2//a/span[2]"
    #list_items :special_offer_filter, xpath: "(//div[@class='filterGroup popular_filters']//li)[2]"
    div :new_products_filter, class: 'button tescoWhite'

    # Methods

    def page_load_element
      search_box_element
    end

    def enter_product_wish_to_buy search_term
      self.search_box = search_term
    end

    def click_on_search
      self.search_element.click
    end

    def is_match_displayed? search_term
       products_elements.length &&
       result_count.include?(search_term)
    end


    def enter_free_text_in_search_field somexyz
      self.free_text_in_search_field = somexyz
    end

    def is_no_match_error_message_displayed? error_message
      #wait_until(10) { @browser.element(:text => "#{error_message}").exists? }
      no_results_message.include?(error_message) &&
          back_to_previous_page_element.exists?
      #wait_until(10) { @browser.element(:text => "#{error_message}").visible? }
    end

    def is_warning_message_displayed?(err_msg)
      warning_message_panel.include? err_msg
    end

    def click_on_area_filter
      specific_filter_elements[0].click
    end

    def is_specific_results_displayed?
      #products_elements.exists?
      products_elements.length > 0
    end

    def click_on_new_products_filter
     new_products_filter_element.click
    end

    def are_new_products_displayed?
     products_elements.length > 0
    end


  end







