package com.ssafy.happyhouse.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.ssafy.happyhouse.model.Pharmacy;

public class pharmacyData{
	final String KEY="=TItOQLvPUcnyuPeLw3e%2BdxVNgUj5vgXfDuQFDjMvvRm%2FpoVEoFNNp%2B%2B4N6EGOXg3POHwnNLEXYX%2FKi5l8IN0yg%3D%3D";
	private Map<String,Object> list = new HashMap<String, Object>();
	
	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
	
	public Map<String,Object> getPharmacy(String sido, String gugun,String lat,String lon) throws UnsupportedEncodingException{
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + KEY); /*Service Key*/
	    urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); 
	    urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(gugun, "UTF-8"));
	    String total="";
	    try {
			String res =gettotal();
			if(res==null) {
				return list;
			}else {
				total=res;
			}
		} catch (IOException | SAXException | ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(total, "UTF-8"));
		System.out.println(total);
	    connectXML(sido,gugun,lat,lon);
		return list;
	}
	
	public pharmacyData() {}
	
	class XMLHandler extends DefaultHandler{
		private List<Pharmacy> handlerlist= new ArrayList<Pharmacy>();
		Pharmacy p;
		String s="";
		Pharmacy minp;
		double min=Double.MAX_VALUE;
		LocDistance dis=new LocDistance();
		private double lat;
		private double lon;
		
		public XMLHandler(String lat,String lon) {
			this.lat = Double.parseDouble(lat);
			this.lon = Double.parseDouble(lon);
		}
		
		public Map<String,Object> getList(){
			Map<String,Object> map = new HashMap<String, Object>();
			List<Pharmacy> list = handlerlist;
			map.put("plist",list);
			map.put("meter",min);
			map.put("minPharmacy",minp);
			return map;
		}

		@Override
		public void startElement(String uri, String localName, String qName, Attributes attributes)
				throws SAXException {
			
			if(qName.equalsIgnoreCase("item")) {
				p=new Pharmacy();
			}
		}

		@Override
		public void endElement(String uri, String localName, String qName) throws SAXException {
			switch (qName) {
			case "dutyAddr":
				p.setDutyAddr(s);
				break;
			case "dutyName":
				p.setDutyName(s);
				break;
			case "dutyTel1":
				p.setDutyTel1(s);
				break;
			case "wgs84Lat":
				p.setWgs84Lat(s);
				break;
			case "wgs84Lon":
				p.setWgs84Lon(s);
				double disres=dis.distance(lat,lon,Double.parseDouble(p.getWgs84Lat()),Double.parseDouble(p.getWgs84Lon()),"meter");
				if(disres<min) {
					min=disres;
					minp = p;
				}
				handlerlist.add(p);
				break;
			case "postCdn1":
				p.setPostCdn1(s);
				break;
			case "postCdn2":
				p.setPostCdn2(s);			
				break;
			
			}
		}

		@Override
		public void characters(char[] ch, int start, int length) throws SAXException {
			if(ch!=null)
				s=new String(ch,start,length).trim();
		}
		
		
	}
	
	private String gettotal() throws IOException, SAXException, ParserConfigurationException {
		URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line).append("\r\n");
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        InputSource is = new InputSource(new StringReader(sb.toString()));
        DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse(is);
		
		Element root = document.getDocumentElement();
		
		NodeList nd = root.getChildNodes();
		for(int i=0;i<nd.getLength();i++) {
			if(nd.item(i).getNodeName().equals("body")) {
				Element body = (Element)nd.item(i);
				NodeList bodychild = body.getChildNodes();
				for(int j=0;j<bodychild.getLength();j++) {
					if(bodychild.item(j).getNodeName().equals("totalCount")) {
						return bodychild.item(j).getTextContent();
					}
				}
			}
		}
		return null;
	}
	
	private void connectXML(String sido, String gugun,String lat,String lon) throws UnsupportedEncodingException {
		 
	     	     
	     URL url=null;
	     SAXParserFactory factory = SAXParserFactory.newInstance(); //싱글턴
	     SAXParser parser = null;
	     
	     try {
				//2.파서 얻기
				parser = factory.newSAXParser();
//				3. handler 만들기
				XMLHandler handler = new XMLHandler(lat,lon);
//				4. parser의 parse 메소드 호출
				url = new URL(urlBuilder.toString());
				InputStream is =url.openConnection().getInputStream();
				parser.parse(is, handler);
				
//				5. handler에서 결과
				list=handler.getList();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	       
	}
	

}
