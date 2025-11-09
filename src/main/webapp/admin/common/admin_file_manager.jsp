<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
              <div class="row align-items-center my-4">
                <div class="col">
                  <h2 class="page-title">Files</h2>
                </div>
                <div class="col-auto">
                  <button type="button" class="btn btn-lg btn-primary"><span class="fe fe-plus fe-16 mr-3"></span>New</button>
                </div>
              </div>
              <h6 class="mb-3">Quick Access</h6>
              <div class="card-deck mb-4">
                <div class="card border-0 bg-transparent">
                  <img src="./assets/products/p4.jpg" alt="..." class="card-img-top img-fluid rounded">
                  <div class="card-body">
                    <h5 class="h6 card-title mb-1">Fusion Backpack</h5>
                    <p class="card-text">
                      <span class="badge badge-light text-muted mr-2">1.2M</span>
                      <span class="badge badge-pill badge-light text-muted">SVG</span>
                    </p>
                  </div>
                </div> <!-- .card -->
                <div class="card border-0 bg-transparent">
                  <img src="./assets/products/p1.jpg" alt="..." class="card-img-top img-fluid rounded">
                  <div class="card-body">
                    <h5 class="h6 card-title mb-1">Luma hoodies</h5>
                    <p class="card-text">
                      <span class="badge badge-light text-muted mr-2">1.2M</span>
                      <span class="badge badge-pill badge-light text-muted">PNG</span>
                    </p>
                  </div>
                </div> <!-- .card -->
                <div class="card border-0 bg-transparent">
                  <img src="./assets/products/p2.jpg" alt="..." class="card-img-top img-fluid rounded">
                  <div class="card-body">
                    <h5 class="h6 card-title mb-1">Luma shorts</h5>
                    <p class="card-text">
                      <span class="badge badge-light text-muted mr-2">1.2M</span>
                      <span class="badge badge-pill badge-light text-muted">SVG</span>
                    </p>
                  </div>
                </div> <!-- .card -->
                <div class="card border-0 bg-transparent">
                  <img src="./assets/products/p3.jpg" alt="..." class="card-img-top img-fluid rounded">
                  <div class="card-body">
                    <h5 class="h6 card-title mb-1">Brown Trousers</h5>
                    <p class="card-text">
                      <span class="badge badge-light text-muted mr-2">1.2M</span>
                      <span class="badge badge-pill badge-light text-muted">SVG</span>
                    </p>
                  </div>
                </div> <!-- .card -->
                <div class="card border-0 bg-transparent">
                  <img src="./assets/products/p3.jpg" alt="..." class="card-img-top img-fluid rounded">
                  <div class="card-body">
                    <h5 class="h6 card-title mb-1">Brown Trousers</h5>
                    <p class="card-text">
                      <span class="badge badge-light text-muted mr-2">1.2M</span>
                      <span class="badge badge-pill badge-light text-muted">SVG</span>
                    </p>
                  </div>
                </div> <!-- .card -->
              </div> <!-- .card-deck -->
              <div class="row align-items-center mb-3 border-bottom no-gutters">
                <div class="col">
                  <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Recent files</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Documents</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Photos</a>
                    </li>
                  </ul>
                </div>
                <div class="col-auto">
                  <button type="button" class="btn btn-sm">
                    <i class="fe fe-16 fe-grid text-muted"></i>
                  </button>
                  <button type="button" class="btn btn-sm">
                    <i class="fe fe-16 fe-list text-muted"></i>
                  </button>
                </div>
              </div>
              <table class="table table-borderless table-striped">
                <thead>
                  <tr>
                    <th></th>
                    <th class="w-50">Name</th>
                    <th>Owner</th>
                    <th>Last Update</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-folder fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-success mr-1"></span>
                    </td>
                    <th scope="row"> Admin Template Components<br />
                      <span class="badge badge-light text-muted">Folder</span>
                    </th>
                    <td class="text-muted">Penelope Roy</td>
                    <td class="text-muted">Mar 17, 2020</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-archive fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-warning mr-1"></span>
                    </td>
                    <th scope="row"> Template<br />
                      <span class="badge badge-light text-muted mr-2">2.2M</span>
                      <span class="badge badge-light text-muted">Zip</span>
                    </th>
                    <td class="text-muted"> Cade Beard </td>
                    <td class="text-muted">Aug 20, 2020</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-film fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-success mr-1"></span>
                    </td>
                    <th scope="row"> Creative Logo<br />
                      <span class="badge badge-light text-muted mr-2">1G</span>
                      <span class="badge badge-light text-muted">Mp4</span>
                    </th>
                    <td class="text-muted">Whilemina Pate</td>
                    <td class="text-muted">Oct 10, 2019</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-folder fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-primary mr-1"></span>
                    </td>
                    <th scope="row"> Bootstrap<br />
                      <span class="badge badge-light text-muted">Folder</span>
                    </th>
                    <td class="text-muted">Lionel Carney</td>
                    <td class="text-muted">Jan 20, 2021</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="5">
                      <span class="small text-muted text-uppercase">Yesterday</span>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-file-text fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-secondary mr-1"></span>
                    </td>
                    <th scope="row"> Template<br />
                      <span class="badge badge-light text-muted mr-2">120K</span>
                      <span class="badge badge-light text-muted">Text</span>
                    </th>
                    <td class="text-muted">Nayda Delacruz</td>
                    <td class="text-muted">Sep 19, 2020</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-pen-tool fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-success mr-1"></span>
                    </td>
                    <th scope="row"> Tiny Admin Homepagge UI<br />
                      <span class="badge badge-light text-muted mr-2">5M</span>
                      <span class="badge badge-light text-muted">PSD</span>
                    </th>
                    <td class="text-muted">Leilani Larson</td>
                    <td class="text-muted">Feb 5, 2020</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center">
                      <div class="circle circle-sm bg-light">
                        <span class="fe fe-file fe-16 text-muted"></span>
                      </div>
                      <span class="dot dot-md bg-warning mr-1"></span>
                    </td>
                    <th scope="row"> Index page convverted<br />
                      <span class="badge badge-light text-muted mr-2">1M</span>
                      <span class="badge badge-light text-muted">HTML</span>
                    </th>
                    <td class="text-muted">Dennis Pollard</td>
                    <td class="text-muted">Oct 30, 2019</td>
                    <td>
                      <div class="file-action">
                        <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu m-2">
                          <a class="dropdown-item" href="#"><i class="fe fe-chevrons-right fe-12 mr-4"></i>Move</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>Copy</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>Rename</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>Share</a>
                          <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>Download</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="list-group list-group-flush my-n3">
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-box fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Package has uploaded successfull</strong></small>
                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-download fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Widgets are updated successfull</strong></small>
                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-inbox fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Notifications have been sent</strong></small>
                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
                      </div>
                    </div> <!-- / .row -->
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-link fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Link was attached to menu</strong></small>
                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
                      </div>
                    </div>
                  </div> <!-- / .row -->
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
              </div>
            </div>
          </div>
        </div>
      </main> <!-- main -->
    </div> <!-- .wrapper -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>