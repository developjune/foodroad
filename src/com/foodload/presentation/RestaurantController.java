package com.foodload.presentation;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodload.domain.Menu;
import com.foodload.domain.Restaurant;
import com.foodload.service.RestaurantService;
import com.foodload.domain.PageInformation;

@Controller
@RequestMapping(value = "/restaurant")
public class RestaurantController {
	@Resource
	private RestaurantService restaurantService;
	
	@RequestMapping(value = "/list")
	public ModelAndView find(HttpServletRequest request, Restaurant restaurant) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/list");
		
		int totalItemCount = this.restaurantService.count(restaurant);
		
		PageInformation pageInformation = new PageInformation(request, totalItemCount);
		modelAndView.addObject("pageNo", pageInformation.getPageNo());
		modelAndView.addObject("pageItemCount", pageInformation.getPageItemCount());
		//modelAndView.addObject("totalPageNo", pageInformation.getTotalPageNo());
		//modelAndView.addObject("divItemCount", pageInformation.getDivItemCount());
		modelAndView.addObject("navigator", pageInformation.getNavigator());

		restaurant.setItemStartNo(pageInformation.getItemStartNo());
		restaurant.setItemEndNo(pageInformation.getItemEndNo());
		
		List<Restaurant> listRestaurant = this.restaurantService.find(restaurant);
		modelAndView.addObject("listRestaurant", listRestaurant);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
	public ModelAndView view(Restaurant restaurant, Menu menu) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/view");
		List<Restaurant> listRestaurant = this.restaurantService.find(restaurant);
		
		modelAndView.addObject("restaurant", listRestaurant);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/addform", method=RequestMethod.GET)
	public ModelAndView addForm(Restaurant restaurant, Menu menu) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/add");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Restaurant restaurant) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);

		this.restaurantService.add(restaurant);

		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);
		
		this.restaurantService.remove(no);
		
		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/editform/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, Restaurant restaurant) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/edit");
		
		restaurant.setNo(no);
		
		List<Restaurant> listRestaurant = this.restaurantService.find(restaurant);
		modelAndView.addObject("restaurant", listRestaurant);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.POST)
	public ModelAndView edit(Restaurant restaurant) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);
		
		this.restaurantService.edit(restaurant);
		
		return new ModelAndView(redirectView);
	}
}
