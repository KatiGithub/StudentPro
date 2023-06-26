package com.mahapro.backend.mahapro.model.Text;

import java.util.List;


import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountType;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.BonusDiscount;
import com.mahapro.backend.mahapro.model.Business.Post.Post;

import jakarta.persistence.*;

@Entity
@Table(name="text_content")
public class TextContent {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="text_id")
    private int id;
    
    @OneToMany(fetch = FetchType.LAZY, orphanRemoval=false)
    @JoinColumn(name="business.business_info_text_id")
    private List<Business> businesses;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = false)
    @JoinColumn(name="discount.discount_title_text_id")
    private List<Discount> discounts;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = false)
    @JoinColumn(name="post.post_content_text_id")
    private List<Post> posts;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = false)
    @JoinColumn(name="discount_type.discount_type_name_id")
    private List<DiscountType> discountTypes;

    @OneToMany(fetch = FetchType.LAZY,orphanRemoval = false)
    @JoinColumn(name="bonus_discount.discount_text_id")
    private List<BonusDiscount> bonusDiscounts;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="translation.text_id")
    private List<Translation> translations;
}
