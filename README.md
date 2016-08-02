### 根据tag返回tags和recipe的id列表
```
curl -X GET -d "locale=zh_CN&q=风" http://115.28.163.219:8080/tag_search.json
```
```
params: 
        {
          locale: en,     # or zh_CN
          q: "风",        # 提交的关键字
          per_page: 10    # default is 25
        }
response:
        {
          "tags":["中文风味4","英文风味4","中文风味3","英文风味3"],
          "paginate_meta":            #分页
          {
            "current_page":1,
            "next_page":2,
            "prev_page":null,
            "total_pages":2,
            "total_count":11            #总数量
          },
          "recipes":[1,2,3,4,5,6,7]
        }
```
### 即时搜索菜谱
```
curl -X GET "term=h" http://115.28.163.219:8080/recipe_search
```
```
params: {
          term: h #已经输入的关键词
        }
response:
        [
          {
            "id":"4",
            "label":"haha",
            "value":"haha"
          },
          {
            "id":"1",
            "label":"hello",
            "value":"hello"
          },
          {
            "id":"6",
            "label":"hello world",
            "value":"hello world"
          },
          {
            "id":"5",
            "label":"kk haha",
            "value":"kk haha"
          }
        ]
```
### BEST_THIS_WEEK
```
curl -X GET -d "locale=en" GET http://115.28.163.219:8080/best_this_week.json
```
```
params: 
        {
          locale: "en" # optianal
          taste_tag: "good",
          limit: 10,
          offset: 20
        }
response:
        {
          recipe_ids: [1,2],
          album_ids: [1,2]
        }
```
### YOU_MAY_LIKE
```
curl -X GET -d "locale=en" GET http://115.28.163.219:8080/you_may_like.json
```
```
params: {
          taste_tag: "good",
          recipe_limit: 10,   #default is 10
          album_limit: 10,    #default is 10
        }
response:
        {
          recipe_ids: [1,2],
          album_ids: [1,2]
        }        
```
