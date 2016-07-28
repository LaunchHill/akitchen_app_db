### 根据tag返回tags和recipe的id列表
```
curl -X GET -d "locale=zh_CN&q=风" http://115.28.163.219:8080/tag_search.json
```
```
params: 
        {
          locale: en,     # or zh_CN
          q: "风"          # 提交的关键字
        }
response:
        {
          "tags":["中文风味4","中文风味3","中文风味1","中文风味2"],
          "recipe_ids":[156]
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