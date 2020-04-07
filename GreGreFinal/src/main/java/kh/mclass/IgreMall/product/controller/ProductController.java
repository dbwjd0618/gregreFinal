package kh.mclass.IgreMall.product.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kh.mclass.Igre.common.util.Utils;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.DefaultProduct;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@GetMapping("/detail.do")
	public ModelAndView product(ModelAndView mav, 
						@RequestParam("productId") String productId,
						HttpServletRequest request) throws Exception {
		log.debug("productId={}", productId);
		
		Product product = productService.selectProductOne(productId);
		List<Attachment> attachList = productService.selectAttachList(productId);
		List<ProdOption> optionList = productService.selectOptionList(productId);
		
		log.debug("attachList={}",attachList);
		log.debug("optionList={}",optionList);
		//옵션이 있는 상품만
		if(!optionList.isEmpty()) {
	
			String[] optNm = optionList.get(0).getOptionName().split(",");
			List<String> optionName = new ArrayList<>();
			for(String o : optNm) {
				optionName.add(o);
			}
			
			List<String> optionValue1 = new ArrayList<String>();
			List<String> optionValue2 = new ArrayList<String>();
			
			for (int i = 0; i < optionList.size(); i++) {
				String[] values= optionList.get(i).getOptionValue().split(",");
				if (!optionValue1.contains(values[0])) {
					optionValue1.add(values[0]);
				}
				if(values.length>1) {
					if (!optionValue2.contains(values[1])) {
						optionValue2.add(values[1]);
					}
					
				}
			}
			
			mav.addObject("optionValue1", optionValue1);//옵션1,옵션2
			mav.addObject("optionValue2", optionValue2);//핑크 ~~
			mav.addObject("optionName", optionName);//10,20담겨있다.
		
			
		}

        
        
     
        
        HttpSession session = request.getSession();
		
        session.setAttribute("p",product);
        session.setAttribute("attachList", attachList);
        mav.addObject("p", product);
		mav.addObject("attachList", attachList);
		mav.addObject("optionList", optionList);//가격정보가 담겨있다.
		
	
		mav.setViewName("shop/product/detail");
		return mav;
	}

	
	
	
	@GetMapping("/defaultinsert.do")
	public String defaultInsert(HttpServletRequest request) {
	
			List<DefaultProduct> defaultProductList = productApi();
			List<Product> productList = new ArrayList<>();
			List<Attachment> attachList=new ArrayList<>();
			Map<String, String> imgMap = new HashMap<>();
			for(DefaultProduct dp : defaultProductList ) {
				Product p = new Product(dp.getSellerId(), dp.getProductId(), dp.getCategoryId(), dp.getProductName(), 
											dp.getBrandName(), dp.getPrice(), dp.getDeliveryFee(),
											dp.getPointRate(), dp.getDiscountPrice(), dp.getProductStock(), 
											dp.getProductDetail(), dp.getEnrollDate(), dp.getProductState());
				String[] images = new String[5];
				images = dp.getProductImages();
				for(int i=0;i<images.length;i++) {
					imgMap.put(dp.getProductId(),images[i]);		
				}
				productList.add(p);
			}
			
			Set<Map.Entry<String, String>> entries = imgMap.entrySet();

			for (Map.Entry<String, String> entry : entries) {

			  Attachment a = new Attachment( 0, entry.getKey(), entry.getValue(), Utils.getRenamedFileName(entry.getValue()), "R");
			  attachList.add(a);
			}

			for (Attachment a : attachList) {
				// 비어있는 MultipartFile객체가 전달된 경우(파일 하나만 업로드)
				// 파일이 없다면 밑에는 실행하지 말아라
				if (a==null)
					continue;

				// 파일 재생성 renamedFileName으로 저장하기
				String originalFileName = a.getOriginalImg();
				String renamedImg= Utils.getRenamedFileName(originalFileName);

				// 파일이동
//				String saveDirectory = request.getServletContext().getRealPath("/resources/upload/shop/productImg");

				// 실제 파일데이터 originalFileName, renamedFileName을 db에 저장
				// Attachment객체
				a.setRenamedImg(renamedImg);


			}
			log.debug("attachList={}", attachList);
			log.debug("productList={}", productList);

			productService.insert(productList);
			productService.insertAttach(attachList);

		return "redirect:/";
	}

	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	public List<DefaultProduct> productApi() {

		List<DefaultProduct> productList = new ArrayList<>();
		String[] keyword = new String[7];
		keyword[0] = "분유";
		keyword[1] = "이유식";
		keyword[2] = "기저귀";
		keyword[3] = "아기물티슈";
		keyword[4] = "이유용품";
		keyword[5] = "수유용품";
		keyword[6] = "유아목욕용품";

		// parsing할 url 지정(API 키 포함해서)
		try {
			int i = 0;
			while (i < keyword.length) {
				System.out.println("keyword[i]" + keyword[i]);
				String text = URLEncoder.encode(keyword[i], "UTF-8");
				String url = "http://openapi.11st.co.kr/openapi/OpenApiService.tmall?key=e373639bdba0fbeba40db5f2b067e677&apiCode=ProductSearch&keyword="
						+ text;

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("Product");
				System.out.println("파싱할 리스트 수 : " + nList.getLength());

				for (int temp = 0; temp < nList.getLength(); temp++) {

					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
						DefaultProduct p = null;
						Element eElement = (Element) nNode;
						// System.out.println(eElement.getTextContent());
						String productID = getTagValue("ProductCode", eElement);
						String productName = getTagValue("ProductName", eElement);
						int price = Integer.parseInt(getTagValue("ProductPrice", eElement)); 
						String deliveryFee = getTagValue("Delivery", eElement);
						String brandName = getTagValue("SellerNick", eElement);
						String productDetail = getTagValue("DetailPageUrl", eElement);
						int discountPrice = Integer.parseInt(getTagValue("Discount", eElement));
						String categoryID = "";

						switch (keyword[i]) {
						case "분유":
							categoryID = "CA1";
							break;
						case "이유식":
							categoryID = "CA2";
							break;
						case "기저귀":
							categoryID = "CA3";
							break;
						case "아기물티슈":
							categoryID = "CA4";
							break;
						case "이유용품":
							categoryID = "CA5";
							break;
						case "수유용품":
							categoryID = "CA6";
							break;
						case "유아목욕용품":
							categoryID = "CA7";
							break;
						default:
							break;
						}
						String[] productImages = new String[5];

						productImages[0] = getTagValue("ProductImage", eElement) != null
								? getTagValue("ProductImage", eElement)
								: "";
						productImages[1] = getTagValue("ProductImage110", eElement) != null
								? getTagValue("ProductImage110", eElement)
								: "";
						productImages[2] = getTagValue("ProductImage200", eElement) != null
								? getTagValue("ProductImage200", eElement)
								: "";
						productImages[3] = getTagValue("ProductImage270", eElement) != null
								? getTagValue("ProductImage270", eElement)
								: "";
						productImages[4] = getTagValue("ProductImage300", eElement) != null
								? getTagValue("ProductImage300", eElement)
								: "";
		
					
						p = new DefaultProduct("igre_mall_test", productID, categoryID, productName, brandName, price,
								deliveryFee, 2, discountPrice, 900, productDetail, null, null, productImages);

						for (int index = 0; index < productList.size(); index++) {
							if (productList.get(index).getProductId().equals(productID)) {
								System.out.println("같음");
								productList.remove(index);
							}
						}

						productList.add(p);

					} // if end
				} // for end

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end

		return productList;
	}
	


}
