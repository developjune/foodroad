package com.foodload.presentation;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodload.domain.Menu;
import com.foodload.domain.PageInformation;
import com.foodload.domain.Picture;
import com.foodload.domain.Restaurant;
import com.foodload.service.PictureService;
import com.foodload.service.RestaurantService;

@Controller
@RequestMapping(value = "/restaurant")
public class RestaurantController {
	@Resource
	private RestaurantService restaurantService;

	@Resource
	private PictureService pictureService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/list")
	public ModelAndView find(HttpServletRequest request, Restaurant restaurant, Picture picture) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/list");

		int totalItemCount = this.restaurantService.count(restaurant);

		PageInformation pageInformation = new PageInformation(request, totalItemCount);
		modelAndView.addObject("pageNo", pageInformation.getPageNo());
		modelAndView.addObject("pageItemCount", pageInformation.getPageItemCount());
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

	@RequestMapping(value = "/addform", method = RequestMethod.GET)
	public ModelAndView addForm(Restaurant restaurant, Menu menu) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/add");

		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Restaurant restaurant, MultipartFile[] file, Picture picture) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);
		this.restaurantService.add(restaurant);

		for (int i = 0; i < file.length; i++) {
			String[] savedName = new String[file.length];
			try {
				savedName[i] = uploadFile(file[i].getOriginalFilename(), file[i].getBytes());
				String[] name = savedName[i].split("_");

				picture.setLogicalName(name[0]);
				picture.setPhysicalName(name[1]);
				picture.setRestaurantNo(restaurant.getNo());

				this.pictureService.add(picture);
				System.out.println("사진 등록 성공");
			} catch (Exception e) {
				System.out.println("오류" + i);
			}
		}

		return new ModelAndView(redirectView);
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = null;
		if (!originalName.equals("")) {
			System.out.println("");
			savedName = uid.toString() + "_" + originalName;
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(fileData, target);
		}

		return savedName;
	}

	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);

		this.restaurantService.remove(no);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/editform/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, Restaurant restaurant, Picture picture) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/restaurant/edit");

		restaurant.setNo(no);

		List<Restaurant> listRestaurant = this.restaurantService.find(restaurant);
		modelAndView.addObject("restaurant", listRestaurant);

		picture.setRestaurantNo(no);
		modelAndView.addObject("listPicture", this.pictureService.find(picture));

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{no}", method = RequestMethod.POST)
	public ModelAndView edit(Restaurant restaurant, MultipartFile[] file, Picture picture) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);

		this.restaurantService.edit(restaurant);

		for (int i = 0; i < file.length; i++) {
			String[] savedName = new String[file.length];
			try {
				savedName[i] = uploadFile(file[i].getOriginalFilename(), file[i].getBytes());
				String[] name = savedName[i].split("_");

				picture.setLogicalName(name[0]);
				picture.setPhysicalName(name[1]);
				picture.setRestaurantNo(restaurant.getNo());

				this.pictureService.add(picture);
				System.out.println("사진 등록 성공");
			} catch (Exception e) {
				System.out.println("오류" + i);
			}
		}

		return new ModelAndView(redirectView);
	}
}
