//
//  PhotoBrowserController.swift
//  ChainPay
//
//  Created by Cobb on 2018/12/10.
//  Copyright © 2018 Beijing Link Chain Technologies Co.,Ltd. All rights reserved.
//

import UIKit

/// 视图消失样式
///
/// - scale: 缩放
/// - rotation: 旋转
/// - slide: 平移
/// - none: 无
enum InteractiveDismissStyle {
    
    case scale
    
    case rotation
    
    case slide
    
    case none
}

/// 背景样式
///
/// - blurPhoto: 毛玻璃图片
/// - blur: 毛玻璃
/// - color: 指定颜色
enum BackgroundStyle {
    
    case blurPhoto
    
    case blur
    
    case color(_ color: UIColor)
}

/// 页面指示器样式
///
/// - dot: 点
/// - text: 文字
/// - none: 无
enum PageIndicatorStyle {
    
    case dot
    
    case text
    
    case none
}

/// 图片加载样式
///
/// - indeterminate: 无进度显示
/// - determinate: 有进度显示
enum ImageLoadingStyle {
    
    case indeterminate
    
    case determinate
}

/// 状态栏样式
///
/// - hidden: 隐藏状态栏
/// - system: 系统样式
enum StatusBarStyle {
    
    case hidden
    
    case system(_ style: UIStatusBarStyle)
}

/// 图片浏览协议
protocol PhotoBrowserDelegate: NSObjectProtocol {
    
    func photoBrowser(browser: PhotoBrowserController, didSelectItem: PhotoItem, index: UInt)
    
    func photoBrowserWillDismiss(browser: PhotoBrowserController)
}

class PhotoBrowserController: UIViewController {
    
    // MARK: - Property
    
    private var scrollView: UIScrollView!
    
    private var photoItems: [PhotoItem]?
    
    /// 复用的item
    private var reusableItemViews: Set<PhotoView> = []
    
    /// 显示的item
    private var visibleItemViews: Set<PhotoView> = []
    
    /// 当前页
    private var currentPage: UInt = 0
    
    /// 背景图
    private var backgroundView: UIImageView!
    
    /// 页码控制器
    private var pageControl: UIPageControl!
    
    /// 页码标签
    private var pageLabel: UILabel!
    
    /// 已经显示标记
    private var presented = false
    
    /// 视图开始位置
    private var startLocation: CGPoint = .zero
    
    /// 动画持续时间
    private let animationDuration: TimeInterval = 0.3
    
    /// Spring动画持续时间
    private let springAnimationDuration: TimeInterval = 0.5
    
    public var dismissStyle: InteractiveDismissStyle = .scale
    
    public var backgroundStyle: BackgroundStyle = .color(.white)
    
    public var pageIndicatorStyle: PageIndicatorStyle = .none
    
    public var loadingStyle: ImageLoadingStyle = .determinate
    
    public var statusBarStyle: StatusBarStyle = .hidden
    
    /// 是否有弹簧效果
    public var bounces = false
    
    public weak var delegate: PhotoBrowserDelegate?
    
    // MARK: - Life Cycle
    
    convenience init(WithPhotoItems items: [PhotoItem],
                     selectedIndex: UInt,
                     dismissStyle: InteractiveDismissStyle = .scale,
                     backgroundStyle: BackgroundStyle = .color(.white),
                     pageIndicatorStyle: PageIndicatorStyle = .none,
                     loadingStyle: ImageLoadingStyle = .determinate,
                     statusBarStyle: StatusBarStyle = .hidden) {
        self.init()
        self.photoItems = items
        self.currentPage = selectedIndex
        self.dismissStyle = dismissStyle
        self.backgroundStyle = backgroundStyle
        self.pageIndicatorStyle = pageIndicatorStyle
        self.loadingStyle = loadingStyle
        self.statusBarStyle = statusBarStyle
        
        self.modalPresentationStyle = .custom
        self.modalTransitionStyle = .coverVertical
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        debugPrint("use init(WithPhotoItems...)")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        debugPrint("use init(WithPhotoItems...)")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        debugPrint("...PhotoBrowserController...")
    }
    
    // MARK: - Public
    
    /// 显示图片浏览视图
    ///
    /// - Parameters:
    ///   - ViewController: 目标视图控制器
    ///   - statusBarStyle: 状态栏样式
    ///   - completion: 完成回调
    public func showFrom(_ controller: UIViewController, statusBarStyle: StatusBarStyle, completion: (() -> Void)?) {
        
    }
    
    /// 隐藏图片浏览器视图
    public func showDismissAnimation() {
        
    }
    
    // MARK: - Private
    
    
}
