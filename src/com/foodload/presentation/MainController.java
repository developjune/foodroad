package com.foodload.presentation;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.foodload.domain.Code;
import com.foodload.domain.Picture;
import com.foodload.domain.Restaurant;
import com.foodload.service.MenuService;
import com.foodload.service.PictureService;
import com.foodload.service.RestaurantService;
import com.foodload.utility.CodeUtil;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	@Resource
	private RestaurantService restaurantService;
	
	@Resource
	private MenuService menuService;
	
	@Resource
	private PictureService pictureService;
	
	@RequestMapping(value = "/index")
	public ModelAndView main(Restaurant restaurant, Picture picture) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/main/index");
		
		List<Restaurant> listRestaurant = this.restaurantService.findMap(restaurant);
		List<Code> listCode = CodeUtil.getCodes();
		
		picture.setRestaurantNo(listRestaurant.get(0).getNo());
		List<Picture> listPicture = this.pictureService.find(picture);
	      
        if (listPicture.size() > 0) {
    	    picture = listPicture.get(0);
        } else {
    	    picture = null;
        }
	      
	    modelAndView.addObject("listPicture", picture);
		modelAndView.addObject("listRestaurant", listRestaurant);
		modelAndView.addObject("codes", listCode);
		modelAndView.addObject("type", restaurant.getType());
		return modelAndView;
	}
}
