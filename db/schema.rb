# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 1) do

  create_table "ak_album", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",              null: false, comment: "合辑所属用户"
    t.integer  "sort",                 null: false, comment: "排序"
    t.integer  "status",     limit: 1, null: false, comment: "状态"
    t.datetime "created_at",           null: false, comment: "创建时间"
    t.datetime "updated_at",           null: false, comment: "更新时间"
    t.datetime "deleted_at",                        comment: "删除时间"
  end

  create_table "ak_album_image", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "album_id",               null: false, comment: "合辑ID"
    t.string   "image",      limit: 128, null: false, comment: "图片"
    t.integer  "type",       limit: 1,   null: false, comment: "1列表图"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "更新时间"
    t.datetime "deleted_at",                          comment: "删除时间"
  end

  create_table "ak_album_recipe", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "album_id",   null: false, comment: "合辑ID"
    t.integer  "recipe_id",  null: false, comment: "食谱ID"
    t.datetime "created_at", null: false, comment: "创建时间"
    t.datetime "updated_at", null: false, comment: "更新时间"
    t.datetime "deleted_at",              comment: "删除时间"
  end

  create_table "ak_album_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "album_id",                null: false, comment: "合辑ID"
    t.string   "locale",     limit: 16,   null: false, comment: "语言"
    t.string   "title",      limit: 128,  null: false, comment: "标题"
    t.string   "paper",      limit: 2048, null: false, comment: "简介"
    t.datetime "created_at",              null: false, comment: "创建时间"
    t.datetime "updated_at",              null: false, comment: "更新时间"
    t.datetime "deleted_at",                           comment: "删除时间"
  end

  create_table "ak_banner", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title",         limit: 256, null: false, comment: "标题"
    t.string   "image",         limit: 128, null: false, comment: "图片"
    t.integer  "relation_id",               null: false, comment: "关联ID"
    t.integer  "relation_type", limit: 1,   null: false, comment: "关联类型 1食谱2合辑"
    t.integer  "sort",          limit: 2,   null: false, comment: "排序"
    t.integer  "status",        limit: 1,   null: false, comment: "状态"
    t.datetime "created_at",                null: false, comment: "创建时间"
    t.datetime "updated_at",                null: false, comment: "更新时间"
    t.datetime "deleted_at",                             comment: "删除时间"
  end

  create_table "ak_content_recommend", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "cuisine_id",              null: false, comment: "风味ID"
    t.integer  "relation_type",           null: false, comment: "1食谱 2合辑"
    t.integer  "relation_id",             null: false, comment: "关联ID"
    t.integer  "sort",          limit: 2, null: false, comment: "排序"
    t.datetime "created_at",              null: false, comment: "创建时间"
    t.datetime "updated_at",              null: false, comment: "更新时间"
    t.datetime "deleted_at",                           comment: "删除时间"
  end

  create_table "ak_notify_sms", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "biz_type",      limit: 1,    null: false, comment: "1注册短信验证码"
    t.string   "locale",        limit: 8,    null: false, comment: "语言"
    t.integer  "user_id",                    null: false, comment: "用户ID"
    t.integer  "sms_provider",  limit: 1,    null: false, comment: "短信服务商 1云通讯"
    t.string   "mobile",        limit: 16,   null: false, comment: "手机号"
    t.integer  "template_sign",              null: false, comment: "模板ID"
    t.string   "parameter",     limit: 512,  null: false, comment: "短信参数"
    t.string   "content",       limit: 512,  null: false, comment: "短信内容"
    t.string   "response",      limit: 1024, null: false, comment: "响应信息"
    t.string   "sms_id",        limit: 64,   null: false, comment: "发送短信ID"
    t.integer  "status",        limit: 1,    null: false, comment: "1发送成功2发送失败"
    t.datetime "created_at",                 null: false, comment: "创建时间"
    t.datetime "updated_at",                 null: false, comment: "更新时间"
    t.datetime "deleted_at",                              comment: "删除时间"
  end

  create_table "ak_notify_sms_template", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "biz_type",         limit: 1,   null: false, comment: "1注册发送验证码2找回密码"
    t.string   "locale",           limit: 8,   null: false, comment: "语言"
    t.integer  "sms_provider",     limit: 1,   null: false, comment: "短信服务商 1云通讯"
    t.string   "template_sign",    limit: 16,  null: false, comment: "服务商短信模板标识"
    t.string   "template_content", limit: 512, null: false, comment: "短信模板内容"
    t.datetime "created_at",                   null: false, comment: "创建时间"
    t.datetime "updated_at",                   null: false, comment: "更新时间"
    t.datetime "deleted_at",                                comment: "删除时间"
  end

  create_table "ak_recipe", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",                   null: false, comment: "所属用户"
    t.integer  "step_id",                   null: false, comment: "步序ID"
    t.string   "default_locale", limit: 16, null: false, comment: "默认语言"
    t.integer  "sort",           limit: 2,  null: false, comment: "排序"
    t.integer  "status",         limit: 1,  null: false, comment: "0禁用1启用2本人可见"
    t.datetime "created_at",                null: false, comment: "创建时间"
    t.datetime "updated_at",                null: false, comment: "更新时间"
    t.datetime "deleted_at",                             comment: "删除时间"
    t.index ["sort"], name: "sort", using: :btree
  end

  create_table "ak_recipe_classify", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",       null: false, comment: "食谱ID"
    t.integer  "classify_lib_id", null: false, comment: "分类ID"
    t.datetime "created_at",      null: false, comment: "创建时间"
    t.datetime "updated_at",      null: false, comment: "更新时间"
    t.datetime "deleted_at",                   comment: "删除时间"
  end

  create_table "ak_recipe_classify_lib", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",               null: false, comment: "用户ID"
    t.string   "title",      limit: 32, null: false, comment: "标题"
    t.integer  "sort",       limit: 2,  null: false, comment: "排序"
    t.integer  "pid",                   null: false, comment: "父ID"
    t.integer  "status",     limit: 1,  null: false, comment: "状态"
    t.datetime "created_at",            null: false, comment: "创建时间"
    t.datetime "updated_at",            null: false, comment: "更新时间"
    t.datetime "deleted_at",                         comment: "删除时间"
  end

  create_table "ak_recipe_classify_lib_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_classify_lib_id",            null: false, comment: "食谱分类库ID"
    t.string   "locale",                 limit: 16, null: false, comment: "语言"
    t.string   "title",                  limit: 32, null: false, comment: "标题"
    t.datetime "created_at",                        null: false, comment: "创建时间"
    t.datetime "updated_at",                        null: false, comment: "更新时间"
    t.datetime "deleted_at",                                     comment: "删除时间"
  end

  create_table "ak_recipe_cuisine", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",             null: false, comment: "食谱ID"
    t.integer  "recipe_cuisine_lib_id", null: false, comment: "食谱风味ID"
    t.datetime "created_at",            null: false, comment: "创建时间"
    t.datetime "updated_at",            null: false, comment: "修改时间"
    t.datetime "deleted_at",                         comment: "删除时间"
  end

  create_table "ak_recipe_cuisine_lib", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "sort",       limit: 2, null: false, comment: "排序"
    t.integer  "status",     limit: 1, null: false, comment: "状态1启用0禁用"
    t.datetime "created_at",           null: false, comment: "创建时间"
    t.datetime "updated_at",           null: false, comment: "修改时间"
    t.datetime "deleted_at",                        comment: "删除时间"
  end

  create_table "ak_recipe_cuisine_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_cuisine_lib_id",            null: false, comment: "食谱风味ID"
    t.string   "locale",                limit: 16, null: false, comment: "语言"
    t.string   "title",                 limit: 64, null: false, comment: "标题"
    t.datetime "created_at",                       null: false, comment: "创建时间"
    t.datetime "updated_at",                       null: false, comment: "更新时间"
    t.datetime "deleted_at",                                    comment: "删除时间"
  end

  create_table "ak_recipe_image", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",              null: false, comment: "食谱ID"
    t.string   "image",      limit: 128, null: false, comment: "图片"
    t.integer  "type",       limit: 1,   null: false, comment: "1列表页图2详情页图"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "更新时间"
    t.datetime "deleted_at",                          comment: "删除时间"
  end

  create_table "ak_recipe_ingredient", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",            null: false, comment: "食谱ID"
    t.integer  "sort",       limit: 2, null: false, comment: "排序"
    t.datetime "created_at",           null: false, comment: "创建时间"
    t.datetime "updated_at",           null: false, comment: "更新时间"
    t.datetime "deleted_at",                        comment: "删除时间"
  end

  create_table "ak_recipe_ingredient_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_ingredient_id",             null: false, comment: "食谱食材"
    t.string   "locale",               limit: 16,  null: false, comment: "语言"
    t.string   "title",                limit: 128, null: false, comment: "标题"
    t.string   "content",              limit: 128, null: false, comment: "内容"
    t.datetime "created_at",                       null: false, comment: "创建时间"
    t.datetime "updated_at",                       null: false, comment: "更新时间"
    t.datetime "deleted_at",                                    comment: "删除数据"
  end

  create_table "ak_recipe_price", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",              null: false, comment: "食谱ID"
    t.integer  "price_lib_id",           null: false, comment: "价格ID"
    t.integer  "unit",         limit: 1, null: false, comment: "价格单位1rmb2usd"
    t.integer  "type",         limit: 1, null: false, comment: "1正常销售价格 2促销价格"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "修改时间"
    t.datetime "deleted_at",                          comment: "删除时间"
  end

  create_table "ak_recipe_price_lib", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "unit",       limit: 1,                          null: false, comment: "价格单位1rmb2usd"
    t.decimal  "price",                precision: 18, scale: 4, null: false, comment: "价格"
    t.integer  "status",     limit: 1,                          null: false, comment: "0禁用1启用"
    t.datetime "created_at",                                    null: false, comment: "创建时间"
    t.datetime "updated_at",                                    null: false, comment: "更新时间"
    t.datetime "deleted_at",                                                 comment: "删除数据"
  end

  create_table "ak_recipe_recommend", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",            null: false, comment: "推荐食谱"
    t.integer  "sort",       limit: 2, null: false, comment: "排序"
    t.datetime "created_at",           null: false, comment: "创建时间"
    t.datetime "updated_at",           null: false, comment: "更新时间"
    t.datetime "deleted_at",                        comment: "删除时间"
  end

  create_table "ak_recipe_tags", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",                null: false, comment: "食谱ID"
    t.integer  "relation_id",              null: false, comment: "关联ID"
    t.integer  "relation_type", limit: 1,  null: false, comment: "1user_tags 2cuisine_tags 3system_tags"
    t.string   "content",       limit: 64, null: false, comment: "标签内容"
    t.string   "locale",        limit: 16, null: false, comment: "语言"
    t.datetime "created_at",               null: false, comment: "创建时间"
    t.datetime "updated_at",               null: false, comment: "更新时间"
    t.datetime "deleted_at",                            comment: "删除时间"
  end

  create_table "ak_recipe_tags_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_tag_id",            null: false, comment: "食谱标签ID"
    t.string   "locale",        limit: 16, null: false, comment: "语言"
    t.string   "content",       limit: 32, null: false, comment: "内容"
    t.datetime "created_at",               null: false, comment: "创建时间"
    t.datetime "updated_at",               null: false, comment: "更新时间"
    t.datetime "deleted_at",                            comment: "删除时间"
  end

  create_table "ak_recipe_translation", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "recipe_id",                 null: false, comment: "食谱ID"
    t.string   "locale",       limit: 16,   null: false, comment: "语言"
    t.string   "title",        limit: 128,  null: false, comment: "标题"
    t.string   "paper",        limit: 2048, null: false, comment: "摘要"
    t.string   "prepare_time", limit: 32,   null: false, comment: "备料时间"
    t.string   "cooking_time", limit: 32,   null: false, comment: "烹饪时间"
    t.string   "rest_time",    limit: 32,   null: false, comment: "休息时间"
    t.string   "yield",        limit: 32,   null: false, comment: "享用人数"
    t.datetime "created_at",                null: false, comment: "创建时间"
    t.datetime "updated_at",                null: false, comment: "更新时间"
    t.datetime "deleted_at",                             comment: "删除时间"
    t.index ["deleted_at"], name: "deleted_at", using: :btree
  end

  create_table "ak_search_history", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "locale",     limit: 16,  null: false, comment: "语言"
    t.string   "keyword",    limit: 256, null: false, comment: "关键词"
    t.integer  "user_id",                null: false, comment: "搜索用户"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "更新时间"
    t.datetime "deleted_at",                          comment: "删除时间"
  end

  create_table "ak_test", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name", limit: 32, null: false
  end

  create_table "ak_user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "password",     limit: 32,   null: false, comment: "密码"
    t.string   "salt",         limit: 32,   null: false, comment: "密码混淆"
    t.string   "name",         limit: 64,   null: false, comment: "用户名称"
    t.string   "introduction", limit: 1024, null: false, comment: "用户简介"
    t.string   "head_image",   limit: 64,   null: false, comment: "头像路径"
    t.integer  "level",        limit: 1,    null: false, comment: "用户等级 1、普通注册用户 2、品牌用户"
    t.datetime "created_at",                null: false, comment: "创建时间"
    t.datetime "updated_at",                null: false, comment: "更新时间"
    t.datetime "deleted_at",                             comment: "删除时间"
    t.index ["name"], name: "name", using: :btree
  end

  create_table "ak_user_account", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",                null: false, comment: "用户ID"
    t.integer  "type",       limit: 1,   null: false, comment: "1邮箱2手机号"
    t.string   "account",    limit: 128, null: false, comment: "账号"
    t.integer  "is_master",  limit: 1,   null: false, comment: "是否主账号"
    t.integer  "is_valid",   limit: 1,   null: false, comment: "是否已验证 0否1是"
    t.integer  "status",     limit: 1,   null: false, comment: "1正常"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "更新时间"
    t.datetime "deleted_at",                          comment: "删除时间"
    t.index ["account", "type"], name: "acount_type", using: :btree
  end

  create_table "ak_user_background_photo", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",         null: false, comment: "用户ID"
    t.integer  "select_photo_id", null: false, comment: "选择背景ID"
    t.datetime "created_at",      null: false, comment: "创建时间"
    t.datetime "updated_at",      null: false, comment: "更新时间"
    t.datetime "deleted_at",                   comment: "删除时间"
  end

  create_table "ak_user_background_photo_lib", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name",       limit: 256, null: false, comment: "图片名称"
    t.integer  "status",     limit: 1,   null: false, comment: "启用"
    t.integer  "is_default", limit: 1,   null: false, comment: "用户未选择，默认展示"
    t.integer  "user_id",                null: false, comment: "所属用户"
    t.integer  "sort",       limit: 2,   null: false, comment: "排序"
    t.datetime "created_at",             null: false, comment: "创建时间"
    t.datetime "updated_at",             null: false, comment: "修改时间"
    t.datetime "deleted_at",                          comment: "删除时间"
  end

  create_table "ak_user_cooking_history", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",                 null: false, comment: "用户ID"
    t.integer  "relation_id",             null: false, comment: "关联类型"
    t.integer  "relation_type", limit: 1, null: false, comment: "关联ID"
    t.datetime "created_at",              null: false, comment: "创建时间"
    t.datetime "updated_at",              null: false, comment: "更新时间"
    t.datetime "deleted_at",                           comment: "删除时间"
  end

  create_table "ak_user_follow", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",          null: false, comment: "关注人"
    t.integer  "followed_user_id", null: false, comment: "被关注人"
    t.datetime "created_at",       null: false, comment: "创建时间"
    t.datetime "updated_at",       null: false, comment: "更新时间"
    t.datetime "deleted_at",                    comment: "删除时间"
    t.index ["user_id", "followed_user_id"], name: "user_followed", unique: true, using: :btree
  end

  create_table "ak_user_like", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",       null: false, comment: "用户"
    t.integer  "relation_id",   null: false, comment: "关联id"
    t.integer  "relation_type", null: false, comment: "1食谱2合辑"
    t.datetime "created_at",    null: false, comment: "创建时间"
    t.datetime "updated_at",    null: false, comment: "更新时间"
    t.datetime "deleted_at",                 comment: "删除时间"
  end

  create_table "ak_user_purchase", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",                 null: false, comment: "用户ID"
    t.integer  "relation_id",             null: false, comment: "已购买ID"
    t.integer  "relation_type", limit: 1, null: false, comment: "已购买类型 1食谱"
    t.datetime "created_at",              null: false, comment: "创建时间"
    t.datetime "updated_at",              null: false, comment: "更新时间"
    t.datetime "deleted_at",                           comment: "删除时间"
  end

end
