<%= content_for :javascript do %>
  <%= render "layouts/wx_js" %>
  <script type="text/javascript">
    wx.ready(function () {
     // 1.分享给朋友
      wx.onMenuShareAppMessage({
        title: wxData.title,
        desc: wxData.desc,
        link: wxData.link,
        imgUrl: wxData.imgUrl,
      });
       // 2. 分享到朋友圈
      wx.onMenuShareTimeline({
        title: wxData.title + wxData.desc,
        link: wxData.link,
        imgUrl: wxData.imgUrl,
      });

       // 3. 图片预览
      var images = $(".am-slides img");
      images.click(function (){
        var image_urls = $.map(images, function(pic){
          return $(pic).attr("original-url");
        });
        var img_src = $(this).prop("src");
        wx.previewImage({
          current: img_src,
          urls: image_urls
        });
      });
    });

  // ....这里还有很多类似的，看官方文档即可。
  </script>
<% end %>
;
