package com.foodload.presentation;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodload.domain.Code;
import com.foodload.domain.Menu;
import com.foodload.domain.Picture;
import com.foodload.domain.Restaurant;
import com.foodload.service.MenuService;
import com.foodload.service.PictureService;
import com.foodload.service.RestaurantService;
import com.foodload.utility.CodeUtil;

@Controller
@RequestMapping("/menu")
public class MenuController {
   @Resource
   private MenuService menuService;
   
   @Resource
   private RestaurantService restaurantService;
   
   @Resource
   private PictureService pictureService;
   
   @Resource(name = "uploadPath")
   private String uploadPath;
   
   @RequestMapping(value = "/list/{restaurantNo}")
   public ModelAndView find(Menu menu, 
         @RequestParam(name = "param", defaultValue = "0") int param) throws Exception {
      ModelAndView modelAndView = new ModelAndView("/menu/list");
      
      menu.setRestaurantNo(param);
      
      List<Menu> listMenu = this.menuService.find(menu);
      modelAndView.addObject("listMenu", listMenu);
      
      return modelAndView;
   }
   
   @RequestMapping(value = "/adminlist/{restaurantNo}", method = RequestMethod.GET)
   public ModelAndView adminFind(@PathVariable("restaurantNo") int restaurantNo, Menu menu, Picture picture) throws Exception {
      ModelAndView modelAndView = new ModelAndView("/menu/adminList");
      
      List<Menu> listMenu = this.menuService.find(menu);
      modelAndView.addObject("listMenu", listMenu);
      
      picture.setRestaurantNo(restaurantNo);
      List<Picture> listPicture = this.pictureService.find(picture);
      
      if (listPicture.size() > 0) {
    	  picture = listPicture.get(0);
      } else {
    	  picture = null;
      }
      
      modelAndView.addObject("listPicture", picture);
      
      List<Code> listCode = CodeUtil.getCodes();
      modelAndView.addObject("codes", listCode);
      
      return modelAndView;
   }
   
   @RequestMapping(value = "/addform/{restaurantNo}", method = RequestMethod.GET)
   public ModelAndView addForm(@PathVariable("restaurantNo") int restaurantNo, Menu menu, Restaurant restaurant) throws Exception {
      ModelAndView modelAndView = new ModelAndView("/menu/add");
      
      menu.setRestaurantNo(restaurantNo);
      restaurant.setNo(restaurantNo);
      
      List<Restaurant> listRestaurant = this.restaurantService.find(new Restaurant());
      modelAndView.addObject("restaurant", listRestaurant);
      
      List<Code> listCode = CodeUtil.getCodes();
      modelAndView.addObject("codes", listCode);
      
      return modelAndView;
   }
   
   @RequestMapping(value = "/add/{restaurantNo}", method = RequestMethod.POST)
   public ModelAndView add(@PathVariable("restaurantNo") int restaurantNo, Menu menu) throws Exception {
      RedirectView redirectView = new RedirectView("/menu/adminlist/{restaurantNo}");
      redirectView.setExposeModelAttributes(false);
      
      this.menuService.add(menu);
      
      return new ModelAndView(redirectView);
   }
   
   @RequestMapping(value = "/editform/{no}", method = RequestMethod.GET)
   public ModelAndView editForm(@PathVariable int no, Menu menu) throws Exception {
      ModelAndView modelAndView = new ModelAndView("/menu/edit");
      
      menu.setNo(no);
      List<Menu> listMenu = this.menuService.find(menu);
      modelAndView.addObject("menu", listMenu );
      
      List<Code> listCode = CodeUtil.getCodes();
      modelAndView.addObject("codes", listCode);
      
      return modelAndView;
   }
   
   @RequestMapping(value = "/edit", method = RequestMethod.POST)
   public ModelAndView edit(Menu menu) throws Exception {
      RedirectView redirectView = new RedirectView("/menu/adminlist/" + menu.getRestaurantNo());
      redirectView.setExposeModelAttributes(false);
      
      this.menuService.edit(menu);
      
      return new ModelAndView(redirectView);
   }
   
   @RequestMapping(value = "/delete", method = RequestMethod.POST)
   public ModelAndView remove(Menu menu) throws Exception {
      RedirectView redirectView = new RedirectView("/menu/adminlist/" + menu.getRestaurantNo());
      redirectView.setExposeModelAttributes(false);
      
      this.menuService.remove(menu);
      
      return new ModelAndView(redirectView);
   }
   
   @RequestMapping(value = "/pictureremoveall", method = RequestMethod.POST)
   public ModelAndView pictureRemoveAll(@RequestParam("nos") int[] nos, Menu menu) throws Exception {
      RedirectView redirectView = new RedirectView("/menu/editform/" + menu.getNo());
      redirectView.setExposeModelAttributes(false);
      
      this.pictureService.removeAll(nos);
      
      return new ModelAndView(redirectView);
   }
}